@implementation MOSuggestionAssetContactProfilePictureProviderAvatar

- (MOSuggestionAssetContactProfilePictureProviderAvatar)init
{
  MOSuggestionAssetContactProfilePictureProviderAvatar *v2;
  CNAvatarImageRenderer *v3;
  CNAvatarImageRenderer *renderer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOSuggestionAssetContactProfilePictureProviderAvatar;
  v2 = -[MOSuggestionAssetContactProfilePictureProviderAvatar init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(CNAvatarImageRenderer);
    renderer = v2->_renderer;
    v2->_renderer = v3;

  }
  return v2;
}

- (void)genericAvatarFor:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10));

  v12 = objc_msgSend(v11, "count");
  v13 = 2;
  if ((unint64_t)v12 < 2)
    v13 = (uint64_t)v12;
  if (v13)
  {
    v14 = 0;
    v15 = &stru_1001EDF88;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v14));
      if (objc_msgSend(v16, "length"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", 0, 1));
        v18 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v17));

        v15 = (__CFString *)v18;
      }

      ++v14;
      v19 = objc_msgSend(v11, "count");
      if ((unint64_t)v19 >= 2)
        v20 = 2;
      else
        v20 = (unint64_t)v19;
    }
    while (v14 < v20);
  }
  else
  {
    v15 = &stru_1001EDF88;
  }
  if (-[__CFString length](v15, "length"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, width, height, 1.0));
    v22 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __94__MOSuggestionAssetContactProfilePictureProviderAvatar_genericAvatarFor_pointSize_completion___block_invoke;
    v24[3] = &unk_1001E3210;
    v25 = v9;
    v23 = objc_msgSend(v22, "renderMonogramForString:scope:imageHandler:", v15, v21, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __94__MOSuggestionAssetContactProfilePictureProviderAvatar_genericAvatarFor_pointSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)avatarForContact:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  double v14;
  void *v15;
  CNAvatarImageRenderer *renderer;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = objc_msgSend(v11, "userInterfaceLayoutDirection") == (id)1;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v13, "scale");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v12, 0, width, height, v14));

  renderer = self->_renderer;
  v22 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __89__MOSuggestionAssetContactProfilePictureProviderAvatar_avatarForContact_size_completion___block_invoke;
  v20[3] = &unk_1001E3210;
  v21 = v9;
  v18 = v9;
  v19 = -[CNAvatarImageRenderer renderAvatarsForContacts:scope:imageHandler:](renderer, "renderAvatarsForContacts:scope:imageHandler:", v17, v15, v20);

}

uint64_t __89__MOSuggestionAssetContactProfilePictureProviderAvatar_avatarForContact_size_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)avatarForContact:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  void *v12;
  CNAvatarImageRenderer *renderer;
  void *v14;
  void *v15;
  id v17;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection") == (id)1;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v9, 0, width, height, v11));

  renderer = self->_renderer;
  v17 = v7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarImageRenderer avatarImageForContacts:scope:](renderer, "avatarImageForContacts:scope:", v14, v12));

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

@end
