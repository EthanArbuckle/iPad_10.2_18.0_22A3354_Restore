@implementation SUISPresentationControllerHelper

+ (void)configureSheetPresentationController:(id)a3
{
  _objc_msgSend(a3, "_setIsRemote:", 1);
}

+ (void)updateSheetPresentationController:(id)a3 withConfiguration:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

  if (v7 != v6)
  {
    v8 = sub_100005480();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "set sheet configuration:%@", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(v5, "_setConfiguration:", v6);
  }

}

+ (void)resetSheetPresentationController:(id)a3
{
  _objc_msgSend(a3, "_resetRemoteDismissing");
}

@end
