@implementation SMSScreenshotUIImages

+ (id)captureScreenshot
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getKeyWindow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageFromView:", v3));

  return v4;
}

+ (id)getKeyWindow
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  CFNotificationCenterRef (**v8)(void);
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedScenes"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v10, "activationState"))
        {
          v11 = objc_opt_class(v8[171]);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = v10;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windows", 0));
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v22;
              while (2)
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v22 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
                  if ((objc_msgSend(v18, "isKeyWindow") & 1) != 0)
                  {
                    v19 = v18;

                    goto LABEL_22;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
                if (v15)
                  continue;
                break;
              }
            }

            v8 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v19 = 0;
    }
    while (v6);
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

+ (id)imageFromView:(id)a3
{
  id v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  UIImage *ImageFromCurrentImageContext;
  void *v9;
  CGSize v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v11.width = v5;
  v11.height = v6;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v9;
}

+ (void)saveImage:(id)a3 filePath:(id)a4 fileName:(id)a5 withHeader:(id)a6
{
  id v9;
  id v10;
  UIImage *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSData *v18;
  void *v19;
  void *v20;
  id v21;

  v9 = a6;
  v10 = a4;
  v11 = (UIImage *)a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.png"), a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v16, "removeItemAtPath:error:", v13, 0);

  }
  v21 = 0;
  objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v13, 1, 4, &v21);
  v17 = v21;
  v18 = UIImagePNGRepresentation(v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  objc_msgSend(v19, "writeToFile:atomically:", v13, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v13));
  if (v20 && !v17 || (NSLog(CFSTR("|--ERROR: Failed to generate file handle at path %@. %@--|"), v13, v17), v20))
    objc_msgSend(v20, "closeFile");

}

@end
