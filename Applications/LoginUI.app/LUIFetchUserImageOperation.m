@implementation LUIFetchUserImageOperation

- (LUIFetchUserImageOperation)initWithUser:(id)a3 imageSize:(unint64_t)a4
{
  id v7;
  LUIFetchUserImageOperation *v8;
  LUIFetchUserImageOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LUIFetchUserImageOperation;
  v8 = -[LUIFetchUserImageOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_user, a3);
    v9->_imageSize = a4;
  }

  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  -[LUIFetchUserImageOperation fetchImage](self, "fetchImage");
}

- (void)fetchImage
{
  void *v3;
  LKUser *user;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIPersistentImageCache sharedCache](LUIPersistentImageCache, "sharedCache"));
  objc_initWeak(&location, self);
  user = self->_user;
  if (!user)
    goto LABEL_9;
  if (!self->_imageSize)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LKUser mediumImageURL](user, "mediumImageURL"));

    if (v8)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LKUser mediumImageURL](self->_user, "mediumImageURL"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000373F4;
      v12[3] = &unk_100069E30;
      v7 = &v13;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      objc_msgSend(v3, "fetchImageForURL:toDestination:scaleToSquareImage:completion:", v6, 1, 1, v12);
      goto LABEL_8;
    }
LABEL_9:
    v9 = objc_loadWeakRetained(&location);
    objc_msgSend(v9, "endOperationWithResultObject:", 0);

    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LKUser largeImageURL](user, "largeImageURL"));

  if (!v5)
    goto LABEL_9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LKUser largeImageURL](self->_user, "largeImageURL"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000374C4;
  v10[3] = &unk_100069E30;
  v7 = &v11;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  objc_msgSend(v3, "fetchImageForURL:toDestination:scaleToSquareImage:completion:", v6, 0, 0, v10);
LABEL_8:

  objc_destroyWeak(v7);
LABEL_10:
  objc_destroyWeak(&location);

}

- (LKUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (unint64_t)imageSize
{
  return self->_imageSize;
}

- (void)setImageSize:(unint64_t)a3
{
  self->_imageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

@end
